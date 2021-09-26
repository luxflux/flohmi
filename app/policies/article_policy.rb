class ArticlePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    !record.sold? || logged_in?
  end

  def create?
    logged_in?
  end

  def update?
    logged_in?
  end

  def destroy?
    logged_in?
  end

  def mark_as_sold?
    logged_in?
  end
end
