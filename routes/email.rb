require 'sendgrid-ruby'
include SendGrid

def send_email
    from = Email.new(email: 'b.vollman@recycleconnect.com.au')
    to = Email.new(email: 'b.vollman@gmail.com')
    subject = 'Sending with SendGrid is Fun'
    content = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
end


def send_question_email
    from = Email.new(email: 'listings@recycleconnect.com.au')
    to = Email.new(email: "#{@listing_owner_email}")
    subject = "Question about your Recycle Connect listing from #{ @username }"
    content = Content.new(type: 'text/plain', value: "#{ @username } has a question about your #{ @listing_title } listing on Recycle Connect.
    
    You can view and respond to the question via your listings page on Recycle Connect here
    http://localhost:4567/listings/#{@question.listing_id}")
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
end


def send_answer_email
    from = Email.new(email: 'listings@recycleconnect.com.au')
    to = Email.new(email: "#{@question_asker_email}")
    subject = "Answer to your question for #{@listing_title} listing on Recycle Connect"
    content = Content.new(type: 'text/plain', value: "#{ @username } has answered your question about #{ @listing_title } listing on Recycle Connect.
    
    You can view the response to your question on listings page of Recycle Connect here
    http://localhost:4567/listings/#{@listing_id}")
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
end
