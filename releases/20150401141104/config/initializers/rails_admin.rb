# RailsAdmin config file. Generated on February 04, 2014 11:19
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|


  ################  Global configuration  ################

  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['Travel Link', 'Admin']
  # or for a more dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_user } # auto-generated
  config.authorize_with { redirect_to('/') unless user_signed_in? && current_user.admin? }

  # Or with a PaperTrail: (you need to install it first)
  config.audit_with :paper_trail, 'User', 'PaperTrail::Version'

  # Display empty fields in show views:
  config.compact_show_view = true

  # Number of default rows per-page:
  config.default_items_per_page = 50

  # Exclude specific models (keep the others):
  config.excluded_models = %w(
    CronPassport
    CronVisa

    SeedMigration
    BaseMigration
    ClearMigration
    TableMigration
    TimaticHelper

    SeedModels::Country
    SeedModels::PassportType
    SeedModels::State
    SeedModels::Purpose
    SeedModels::VisaEntry
  )

  # Include specific models (exclude the others):
  # config.included_models = []

  # Label methods for model instances:
  # config.label_methods << :description # Default is [:name, :title]

  ################  Model configuration  ################

  config.model 'User' do
    object_label_method do
      :custom_label_method
    end

    # edit do
    #   field :email
    #   field :first_name
    #   field :last_name
    #   field :password
    #   field :password_confirmation
    #   include_all_fields
    # end

    # field :type, :enum do
    #   enum do
    #     ['User', 'Manager']
    #   end
    # end



    configure :type, :enum do
      enum do
        ['User', 'Manager']
      end
    end

    configure :trips do
      visible(false)
    end

    configure :visas do
      visible(false)
    end

    configure :passports do
      visible(false)
    end

    configure :secure_messages do
      visible(false)
    end

    configure :request_callbacks do
      visible(false)
    end

    configure :passport_requests do
      visible(false)
    end

  end

  config.model 'Manager' do

    object_label_method do
      :custom_label_method
    end

    configure :type do
      visible(false)
    end

    configure :trips do
      visible(false)
    end

    configure :visas do
      visible(false)
    end

    configure :passports do
      visible(false)
    end

    configure :secure_messages do
      visible(false)
    end

    configure :request_callbacks do
      visible(false)
    end

    configure :passport_requests do
      visible(false)
    end

    configure :users do
      visible(false)
    end

  end

  def custom_label_method
    "#{self.email} (#{self.full_name})"
  end

  config.model 'Company' do
    configure :trips do
      hide
    end
    configure :visas do
      hide
    end
    configure :passports do
      hide
    end
  end

  config.model 'Setting' do
    edit do
      configure :key do
        hide
      end
    end
  end

  config.model 'State' do
    configure :trips do
      hide
    end
    edit do
      configure :code do
        hide
      end
    end
  end

  config.model 'VisaEntry' do
    edit do
      configure :code do
        hide
      end
    end
  end

  config.model 'Purpose' do
    edit do
      configure :code do
        hide
      end
      configure :timatic_code do
        hide
      end
    end
  end

  config.model 'PassportType' do
    edit do
      configure :code do
        hide
      end
      configure :timatic_code do
        hide
      end
    end
  end

  config.model 'Passport' do
    list do
      include_all_fields
      field :user do
        searchable :email
        queryable true
      end
    end
  end

  config.model 'PassportRequest' do
    list do
      include_all_fields
      field :user do
        searchable :email
        queryable true
      end
    end
  end

  config.model 'RequestCallback' do
    list do
      include_all_fields
      field :user do
        searchable :email
        queryable true
      end
    end
  end

  config.model 'SecureMessage' do
    list do
      include_all_fields
      field :user do
        searchable :email
        queryable true
      end
    end
  end

  config.model 'Trip' do
    list do
      include_all_fields
      field :user do
        searchable :email
        queryable true
      end
    end
  end

  config.model 'Visa' do
    list do
      include_all_fields
      field :user do
        searchable :email
        queryable true
      end
    end
  end

  config.model 'User::Profile' do

    visible false

    edit do
      configure :user do
        hide
      end
    end

  end


end
