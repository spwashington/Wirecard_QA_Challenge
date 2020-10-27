Given('json body: {string}') do |_File|
    @m_Utils = Utils.new
    @m_Json = @m_Utils .getJson(_File)
end

Then('api send a post request to create a payment order and return code {string} with status {string} and a valid order id') do |_Code, _Status|
    @m_Response = HTTParty.post($API_PaymentOrder_URL, :body => @m_Json, :basic_auth => $API_AUTH, :headers => $API_HEADER)
    expect(@m_Response.code.to_i).to eql _Code.to_i
    expect(@m_Response.parsed_response["status"]).to eql _Status
    expect(@m_Response.parsed_response["id"].length).to be > 0
    # print @m_Response
end
  
Then('is possible check this payment order in wirecard account dashboard and status is {string}') do |_StatusInDashboard|
    #ORD-1ZUA54GDNNXZ
    @m_Utils.openOrders
    @m_Utils.confirmModalOrder
    @m_Utils.searchOrder(@m_Response.parsed_response["id"])
    @m_Utils.confirmAllModalOrder
    expect(@m_Utils.m_ClientOrderID.text).to eql @m_Response.parsed_response["id"]
    expect(@m_Utils.m_ClientOrderName.text).to eql @m_Response.parsed_response["ownId"]
    expect(@m_Utils.m_ClientOrderStatus.text).to eql _StatusInDashboard
end

Then('api send a post request to create a payment to orderId: {string} and return code {string} with status {string} and a valid order id') do |_OrderID, _Code, _Status|
    @m_OrderIDCode = _OrderID
    url = $API_PaymentOrder_URL + _OrderID + "/payments"
    @m_Response = HTTParty.post(url, :body => @m_Json, :basic_auth => $API_AUTH, :headers => $API_HEADER)
    expect(@m_Response.code.to_i).to eql _Code.to_i
    expect(@m_Response.parsed_response["status"]).to eql _Status
    # print @m_Response
end
  
Then('is possible check this payment in wirecard account dashboard and status is {string}') do |_StatusInDashboard|
    @m_Utils.openOrders
    @m_Utils.confirmModalOrder
    @m_Utils.searchOrder(@m_OrderIDCode)
    @m_Utils.confirmAllModalOrder
    expect(@m_Utils.m_ClientOrderStatus.text).to eql _StatusInDashboard
end