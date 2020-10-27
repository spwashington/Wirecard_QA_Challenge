class Utils < SitePrism::Page
    set_url '/'
    ############## Main Page Elements ##############
    element :m_EmailField, "input[name='login']"
    element :m_PasswordField, "input[name='password']"
    element :m_LoginButton, "button[type='submit']"
    ############## Dashboard Page Elements ##############
    element :m_ModalCloseButton, "button[class='close']"
    element :m_WirecardLogo, '.mg-logo-register'
    element :m_MyAccountDropdown, "span[class='username']", match: :first
    element :m_OrderButtonNav, '#tour-pedidos'
    ############## Order Page Elements ##############
    element :m_ModalConfirmOrder, '.joyride-next-tip.btn-moip-blue', match: :first
    element :m_OrderSearch, '#order-search-filters .row-fluid #q'
    element :m_ConfirmMoldalElement, '.joyride-modal-bg', match: :first
    element :m_ClientOrderID, '.row-fluid.order-h-id span'
    element :m_ClientOrderName, '.order-h-title .title'
    element :m_ClientOrderStatus, 'bdi', match: :first

    def login(_Email, _Password)
        m_EmailField.set _Email
        m_PasswordField.set _Password
        m_LoginButton.click
    end

    def confirmAllModalOrder
        find(".joyride-next-tip.btn-moip-blue", match: :first)
        all(".joyride-next-tip.btn-moip-blue").each(&:click)
    end

    def confirmModalOrder
        temp = m_ConfirmMoldalElement['style'].split(';')

        # "display: none;" / "display: block;"
        while temp[0].include? "block"
            bt = has_css?('.joyride-next-tip.btn-moip-blue')

            if bt == true
                m_ModalConfirmOrder.click
            end

            temp = m_ConfirmMoldalElement['style'].split(';')
        end 
    end

    def closePhoneModal
        temp = has_css?('#modal-verificate-phone')

        if temp == true
            bt = find_all("button[class='close']")
            bt[1].click
        end
    end

    def openOrders
        m_OrderButtonNav.click
    end

    def getJson(_File)
        file = File.join(File.dirname(__FILE__), '..', 'json', _File)
        data = File.read(file)
        return data
        #file = JSON.parse(data)
    end

    def searchOrder(_OrderID)
        m_OrderSearch.set _OrderID
        m_OrderSearch.native.send_keys(:return)
    end
end