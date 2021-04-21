import consumer from "./consumer"


$(document).ready(function() {

const orderID = $("#order-id")
if(orderID){
  console.log(orderID);
  const order_id = orderID.attr("data-order-id");
  consumer.orders = consumer.subscriptions.create({channel: 'OrderDetailsChannel', order_id: order_id}, {  
    received: function(data) {
      $("#orderTable").removeClass('hidden')
      if(data.action == "add")
        return $('#orderTable').append(this.renderOrder(data));

      else if(data.action == "edit")
        return $(`#${data.id}`).replaceWith(this.renderOrder(data));
         
      else if(data.action == "delete")
        return $(`#${data.id}`).remove();
    },

    renderOrder: function(data) {
      return `<tr id=${data.id}>`+ "<td>" + data.full_name + "</td>" + "<td>" + data.name + "</td>"
      +"<td>" + data.amount + "</td>" 
      + "<td>" + data.price + "</td>" 
      + "<td>" + data.comment + "</td>"+"</tr>"
    },
  });
 }
})