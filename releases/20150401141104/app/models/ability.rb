class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can [:manage], User, :id => user.id
    apply_user_rights(user)
    apply_manager_rights(user) if user.manager?
    apply_admin_rights(user)   if user.admin?
  end

  def change_aliases!
    alias_action [:current, :previous, :upcoming, :my], :to => :index
  end

  def apply_user_rights(user)
    can [:manage], [
        Trip,
        Visa,
        Passport,
        SecureMessage,
        RequestCallback,
        PassportRequest
    ], :user_id => user.id
  end

  def apply_manager_rights(manager)
    manage_user_ids    = manager.user_ids
    manage_company_ids = manager.company_ids
    can [:read],   [ Company ],              :id => manage_company_ids
    can [:manage], [ User ],                 :id => manage_user_ids
    can [:read],   [ Visa, Trip, Passport ], :user_id => manage_user_ids
  end

  def apply_admin_rights(user)
    can :access, :rails_admin
  end

end
