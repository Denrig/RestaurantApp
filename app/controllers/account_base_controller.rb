class AccountBaseController < ApplicationController
  skip_before_action :authorized?
end
