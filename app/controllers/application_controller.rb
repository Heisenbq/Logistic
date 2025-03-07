class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  rescue_from ActiveRecord::ConnectionNotEstablished, with: :handle_db_connection_error
  rescue_from ActiveRecord::StatementInvalid, with: :handle_db_statement_error

  private
  def handle_db_connection_error(exception)
    Rails.logger.error "Ошибка подключения к базе данных: #{exception.message}"
    render plain: "Ошибка подключения к базе данных", status: :service_unavailable
  end

  def handle_db_statement_error(exception)
    Rails.logger.error "Ошибка выполнения SQL-запроса: #{exception.message}"
    render plain: "Ошибка базы данных.", status: :internal_server_error
  end
end
