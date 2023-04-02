# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Article

    return unless user.present?

    if user.is_admin?
      can :manage, Article
    else
      can %i[update destroy edit], Article, user: user
      can %i[create new], Article
    end
  end
end
