Role.find_or_create_by({name: "admin", display_name: "Admin"})

def create_admin_user!(email)
  password = SecureRandom.hex

  admin_user = User.where(email: email).first
  return if admin_user.present?

  admin_user ||= User.new(
    email: email,
    name: "Bruce Wayne",
    password: password,
    password_confirmation: password
  )

  admin_user.save!
  admin_user.user << Role.find_by_name("admin")

  puts "The following admin user has been created:"
  puts ""
  puts "  Email: #{admin_user.email}"
  puts "  Password: #{admin_user.password}"
end

create_admin_user!(ENV.fetch("ADMIN_EMAIL"))
