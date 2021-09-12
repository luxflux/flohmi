class ArticlePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
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
end
