class ApplicationRecord < ActiveRecord::Base
  include DashboardHelper
  primary_abstract_class

  def update_dashboard
    broadcast_update_to 'dashboard-summary', target: 'dashboard-summary', partial: 'pages/dashboard_summary', locals: summary
  end
end
