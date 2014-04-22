# Node: pe v3
#
# Install la plateforme pe v3
#
node /^.*vworkshopint.*$/ inherits base{

    # Role
    class{ role::workshop::ftp_r: }
}
