# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Article

    return unless user.present?
    can %i[update destroy edit], Article, user: user
    can %i[create new], Article
  end
end
