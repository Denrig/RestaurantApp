class AccountBaseController < ApplicationController
  skip_before_action :authorize
end
