User.create!(name:  'Example User',
             email: 'example@saintjournal.com',
             password:              'foobar',
             password_confirmation: 'foobar',
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
end
