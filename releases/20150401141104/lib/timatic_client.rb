class TimaticClient
  require 'digest/md5'
  USERNAME      = 'TIMWEB1'
  SUB_USERNAME  = 'ProLinkXML'
  PASSWORD      = 'sDe486hKyQ'
  WSDL_URL      = 'http://staging.timatic.aero/timaticwebservices/timatic3.WSDL'
  SERVICE_NAME  = :timatic3services
  PORT_NAME     = :timatic3servicesPort

  TIMESTAMP_FORMAT = '%Y-%m-%dT%T'
  attr_accessor :client, :session_id, :random_number

  def initialize
    @client = Savon.client({:wsdl => WSDL_URL, :pretty_print_xml => false})
  end

  def authorize!
    request_id = Setting.timatic_request_counter
    check_name_response = checkName(request_id).body[:process_login_response][:check_name_response]
    @session_id    = check_name_response[:session_id]
    @random_number = check_name_response[:random_number]
    client.globals.soap_header("<m:sessionID xmlns:m=\"http://www.opentravel.org/OTA/2003/05/beta\">#{session_id}</m:sessionID>")
    loginRequest(request_id)
  end

  def trip_info(trip)
    authorize!
    message = {
        :document_request => {
            :requestID            => Setting.timatic_request_counter,
            :residentCountryCode  => trip.user.passport.country.code,
            :nationalityCode      => trip.user.passport.country.code,
            :issueCountryCode     => trip.from.code,
            :destinationCode      => trip.to.code,
            :documentType         => 'passport',
            :section              => 'Passport,Visa',
            :stayDuration         => {:days => trip.duration_of_stay},
            :documentGroup        => 'N',
            :arrivalDate          => trip.date_from.strftime(TIMESTAMP_FORMAT)
        }
        #,#:paramRequest => {:transitCountry => trip.transit_country.code}
    }

    response = client.call(:process_request, :message => message)
    response.body[:process_request_response][:document_response][:document_check_response][:document_country_information]

  rescue Exception => e
    puts e.message
    puts response.inspect

  end

  private

    def checkName(request_id = 1)
      client.call(:process_login, :message => {
          :checkNameRequest => {
              :requestID => request_id,
              :username => USERNAME,
              :subUsername => SUB_USERNAME
          }
      })
    end

    def loginRequest(request_id = 1)
      client.call(:process_login, :message => {
          :loginRequest => {
              :requestID => request_id,
              :loginInfo => Digest::MD5.hexdigest("#{Digest::MD5.hexdigest(PASSWORD)}#{random_number}#{session_id}")
          }
      })
    end

end