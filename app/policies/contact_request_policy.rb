class ContactRequestPolicy < ApplicationPolicy
  def index?
    logged_in?
  end

  def create?
    true
  end
end
