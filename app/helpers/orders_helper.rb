module OrdersHelper
  require 'rqrcode'

  def create_qr_image(link)
    qrcode = RQRCode::QRCode.new(link)
    qrcode.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 3,
      standalone: true
    ).html_safe
  end
end
