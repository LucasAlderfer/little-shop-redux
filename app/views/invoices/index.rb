<html>
<head>
  <title>Little Shop</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta charset="UTF-8">
  <!-- <link rel="stylesheet" type="text/css" href="/main.css">
  <link href="https://fonts.googleapis.com/css?family=Comfortaa|Didact+Gothic|Monoton" rel="stylesheet"> -->
</head>
<body>
  <div class="header">
    <header>
      <div class="navcontainer">
        <nav class="fixednav">
          <div class="leftnav"><a href="#">LittleSHOP</a></div>
          <div class="rightnav"><a href="#" class="hvr-pop">Invoices</a></div>
          <div class="rightnav"><a href="#" class="hvr-pop">Items</a></div>
          <div class="rightnav"><a href="#" class="hvr-pop">Invoices</a></div>
        </nav>
      </div>
    </header>
  </div>
  <table class="invoices_table">
    <% @invoices.each do |invoice| %>
    <tr>
      <td><a href="/invoices/<%= invoice.id %>" class="hvr-pop"><%= invoice.name %></a></td>
      <td><a href="/invoices/<%= invoice.id %>/edit" >edit</a></td>
      <td>
        <form action="/invoices/<%= invoice.id %>" method='POST'>
          <input type='hidden' name='_method' value='DELETE'>
          <input type='submit' value='delete' />
        </form>
      </td>
    </tr>
    <% end %>
  </table>
</body>
</html>
