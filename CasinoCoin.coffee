command: "/usr/bin/curl -s https://api.coinmarketcap.com/v1/ticker/casinocoin/"

refreshFrequency: 60000 #ms

style: """
  bottom: 10px
  left: 20px
  color: #fff
  font-family: sans script

  table
    border-collapse: collapse
    table-layout: fixed
    -webkit-font-smoothing: antialiased
    -moz-osx-font-smoothing: grayscale

    &:after
      content: 'Casinocoin'
      position: absolute
      left: 17px
      top: -32px
      font-size: 48px
      color: #ff0000

  td
    font-size: 66px
    font-weight: 200
    overflow: hidden
    text-shadow: 0 0 1px rgba(#000, 0.5)

  #change
    font-size: 48px

    

"""


update: (output, domEl) ->

  res  = JSON.parse(output)

  price = res[0].price_usd
  change = res[0].percent_change_24h
  $domEl = $(domEl)

  $domEl.find('#price').text price
  $domEl.find('#change').text '('+change+'%)'

render: (o) -> """
  <table>
    <tr>
      <td>$<span id='price'></span> <span id='change'></span></td>
    </tr>
  </table>
"""
