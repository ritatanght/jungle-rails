class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

   def order_receipt_email
    @order = params[:order]
    @email = @order.email
    mail(to: @email, subject: "Your order##{@order.id} at Jungle")
  end
end
