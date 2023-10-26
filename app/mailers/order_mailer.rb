class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

   def order_receipt_email
    @order = params[:order]
    puts @order
    @email = @order.email
    @url  = "http://localhost:3000/orders/#{@order.id}"
    mail(to: @email, subject: "Thank you for your order##{@order.id} at Jungle")
  end
end
