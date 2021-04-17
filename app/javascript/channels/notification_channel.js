import consumer from "./consumer"

document.addEventListener('turbolinks:load', ()=>{

  // Getting id of user to establish a connection
  const idDivElement = document.querySelector("#user-id");
  if (idDivElement){
    const user_id = idDivElement.getAttribute("data-user-id");
    
    // We check to see of connection exists, if so we don't create a new connection
    const subscriptions = consumer.subscriptions.subscriptions;
    let notificationsubscription = subscriptions.find((subscriptionsObject)=>{
      const identifierObj = JSON.parse(subscriptionsObject.identifier);
      return identifierObj.channel = "NotificationChannel"
    });
    if(!notificationsubscription){
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
    }
  }
});




