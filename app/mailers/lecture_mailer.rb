class LectureMailer < ApplicationMailer
  default from: 'nekkoro5@gmail.com'
 
  def contract_notificate_email(contract)
    @contract = contract
    @host_user = contract.host_user
    mail(to: @host_user.email, subject: 'あなたのレクチャーが新しく契約されました')
  end

end
