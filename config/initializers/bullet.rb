if defined?(Bullet)
  Rails.application.config.after_initialize do
    Bullet.enable = true
    Bullet.console = true
    Bullet.bullet_logger = true
    Bullet.rails_logger = true
  end
end
