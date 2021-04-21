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
      else if(data.action == "edit"){
        
      }
         
      else if(data.action == "delete")
        return $(`#${data.id}`).remove();
    },

    renderOrder: function(data) {
      return "<tr>"+ "<td>" + data.full_name + "</td>" + "<td>" + data.name + "</td>"
      +"<td>" + data.amount + "</td>" 
      + "<td>" + data.price + "</td>" 
      + "<td>" + data.comment + "</td>"+"</tr>"
    },
    editItem: function(data){

    }


  });
 }
})

// consumer.subscriptions.create("OrderDetailsChannel" ,{
//   connected() {
//     // Called when the subscription is ready for use on the server
//     console.log("Connected to OrderDetailsChannel"+order_id);
//   },

//   disconnected() {
//     // Called when the subscription has been terminated by the server
//   },

//   received(data) {
//     // Called when there's incoming data on the websocket for this channel
//     console.log("here"+data);
//     order = document.getElementsById("orderTable")
//     order.innerHtml += 
//     "<tr>"+ 
//     "<td>" + data.full_name + "</td>" 
//     + "<td>" + data.name + "</td>"
//     +"<td>" + data.amount + "</td>" 
//     + "<td>" + data.price + "</td>" 
//     + "<td>" + data.comment + "</td>"+"</tr>"
//   }
// });
