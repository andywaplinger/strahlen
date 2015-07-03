class CustomersController < ApplicationController
  def create
    @customer = Customer.new(customer_params)

    begin
      @saved = @customer.save
      cookies[:hide_optin] = { :value => "true"}
    rescue

    end
  end

  def hide_optin_bar
    cookies[:hide_optin] = { :value => "true", :expires => Time.now + 3600}
  end

  private
  def customer_params
    params.require(:customer).permit(:email)
  end

end
