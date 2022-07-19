class RegistrationsController < Devise::RegistrationsController
  def create
    super do |r|
      Profile.create(name: 'Your name', bio: 'Your bio', user_id: r.id)
    end
  end
end
