module CarrierServices
  class Mtn
    BALANCE_URL="http://www.mtn.co.za/Internet/MyAccount/Pages/Balance.aspx"

    def get_balance(msisdn,pin)
        agent = Mechanize.new
        agent.user_agent_alias = 'Mac Safari'
        page = agent.get BALANCE_URL
        login = page.form_with :name => "aspnetForm"
        #puts login.inspect
        login.field_with(:name => /UserName/).value = msisdn
        login.field_with(:name => /Password/).value = pin
        #Stupid aspx has javascript links, this value MIGHT change and then we need to pull it out via regex :(
        login.add_field!('ctl00$ctl00$ctl09$g_22bbfcb4_42f7_422e_af7b_16e2d59216f4$ctl01$LoginView1$Login1$Login1$LoginButton', 'ctl00$Login1')
      

        balance = login.submit
        number_div = (balance.search('span').find_all { |node| node['id'] =~ /blMsisdn/}).first
        balance_div = (balance.search('span').find_all { |node| node['id'] =~ /lblPurchaseLimit/}).first

        #puts number_div.text
        #puts balance_div.text
       
        #puts "----"
        bundle_type_div = (balance.search('span').find_all { |node| node['id'] =~ /lblBundleType/}).first
        bundle_amount_div = (balance.search('span').find_all { |node| node['id'] =~ /lblBundleBalance/}).first
        bundle_expire_div = (balance.search('span').find_all { |node| node['id'] =~ /lblBundleExpDate/}).first


        #puts bundle_type_div.text
        #puts bundle_amount_div.text
        #puts bundle_expire_div.text
        {
          :msisdn  =>number_div.text,
          :airtime =>balance_div.text,
          :bundles => [
            {
              :type=>bundle_type_div.text,
              :amount=>bundle_amount_div.text,
              :expires=>bundle_expire_div.text
            }
          ]
        }
    end
  end
end
