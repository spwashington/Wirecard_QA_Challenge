When('access account sandbox site') do
    @m_Utils = Utils.new
    @m_Utils.load
    expect(@m_Utils.wait_until_m_WirecardLogo_visible).to eql true
end

Given('a valid account with {string} and {string}') do |_UserEmail, _Password|
    expect(@m_Utils.wait_until_m_EmailField_visible).to eql true
    expect(@m_Utils.wait_until_m_PasswordField_visible).to eql true
    expect(@m_Utils.wait_until_m_LoginButton_visible).to eql true
    @m_Utils.login(_UserEmail, _Password)
end

Then('can be accessed wirecard dashboard') do
    @m_Utils.closePhoneModal
    expect(@m_Utils.wait_until_m_MyAccountDropdown_visible).to eql true
end