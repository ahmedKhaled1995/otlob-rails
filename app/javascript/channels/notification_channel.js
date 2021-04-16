import consumer from "./consumer"

document.addEventListener('turbolinks:load', ()=>{

  // Getting id of user to establish a connection
  const idDivElement = document.querySelector("#user-id");
  const user_id = idDivElement.getAttribute("data-user-id");
  //console.log(user_id);

  consumer.subscriptions.create({ channel: "NotificationChannel", user_id: user_id }, {
    connected() {
      // Called when the subscription is ready for use on the server
      console.log("Connected to notification channel " + user_id);
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
  
    received(data) {
      // Called when there's incoming data on the websocket for this channel
      console.log("---------------------");
      console.log(data);
      console.log("---------------------");
    }
  });

});




