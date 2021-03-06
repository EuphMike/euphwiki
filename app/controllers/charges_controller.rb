class ChargesController < ApplicationController

def create

  customer = Stripe::Customer.create(
    email: current_user.email,
    card: params[:stripeToken]
  )
 
  charge = Stripe::Charge.create(
    customer: customer.id,
    amount: 15_00,
    description: "Premium Membership - #{current_user.email}",
    currency: 'usd'
  )
  
  upgrade_current_user
  
  flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
  redirect_to root_path
 
  
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_charge_path
end

  def downgrade
    downgrade_current_user
    redirect_to wikis_path
  end

    
  def new
      
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Premium Membership - #{current_user}",
      amount: 15_00
    }
  end
end
