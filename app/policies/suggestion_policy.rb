class SuggestionPolicy < ApplicationPolicy
	def index?
		true
	end

	def create?
		user.present?
	end

	def destroy?
		# 'user' and 'record' are present
	    user.present? && record.suggester == user
	end

	def edit?
		destroy?
	end

	def update?
		edit?
	end

	def vote?
		user.present? && record.suggester != user
	end

end
