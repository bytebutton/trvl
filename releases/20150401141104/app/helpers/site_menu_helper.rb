module SiteMenuHelper

  def get_sub_menu(tab)
    menu = ''
    tab[:sub_menu].each { |sub_menu| menu.concat(link_to(sub_menu[:title], sub_menu[:link], :class => 'btn btn-block btn-large btn-primary')) }
    menu
  end

  def table_tab(tab , options = {})
    link_to( tab[:sub_menu].present? || options[:not_access] ? 'javascript: void(0)' : tab[:link], :class => 'btn-block button_menu', :data => options[:data] ) do
      image_tag("icons/#{tab[:code]}.png") + content_tag(:br) + content_tag(:span,tab[:code], :class => 'title-menu')
    end
  end

  def site_menu
    [
        {
            :title      => 'My Profile',
            :code       => 'profile',
            :link       => edit_user_path(current_user),
            :controller => 'users',
            :visible    => true,
        },
        {
            :title => 'My Trips',
            :code  => 'trips',
            :controller => 'trips',
            :link  => trips_path,
            :visible    => true,
            :sub_menu => [
                {
                    :title => 'Create Trip',
                    :code  => 'create_trip',
                    :link  => new_trip_path
                },
                {
                    :title => 'Current Trips',
                    :code  => 'current_trips',
                    :link  => current_trips_path
                },
                {
                    :title => 'Upcoming Trips',
                    :code  => 'upcoming_trips',
                    :link  => upcoming_trips_path
                },
                {
                    :title => 'Deleted Trips',
                    :code  => 'deleted_trips',
                    :link  => deleted_trips_path
                },
                {
                    :title => 'Previous Trips',
                    :code  => 'upcoming_trips',
                    :link  => previous_trips_path
                }
            ]
        },
        {
            :title => 'My Passports',
            :code  => 'passport',
            :controller => 'passports',
            :visible    => true,
            :link  => passports_path
        },
        {
            :title => 'My Visas',
            :code  => 'visas',
            :controller => 'visas',
            :visible    => true,
            :link  => visas_path,
            :sub_menu => [
                {
                    :title => 'My Visas',
                    :code  => 'visas',
                    :link  => my_visas_path
                },
                {
                    :title => 'Add New Visa',
                    :code  => 'add_visa',
                    :link  => new_visa_path
                }
            ]
        },
        {
            :title => 'Administration',
            :code  => 'admin',
            :controller => '',
            :visible    => true,
            :link  => rails_admin_path
        },
        {
            :title => 'Management',
            :code  => 'management',
            :controller => 'manager/companies',
            :visible    => false,
            :link  => manager_companies_path
        },
        {
            :title => 'Contact',
            :code  => 'contact',
            :controller => 'contact',
            :visible    => true,
            :link  => contact_path
        }
    ]
  end

end
