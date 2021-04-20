import consumer from "./consumer"

document.addEventListener('turbolinks:load', ()=>{

  

  // console.log(notificationsElement.innerHTML);

  // Getting id of user to establish a connection
  const idDivElement = document.querySelector("#user-id");
  if (idDivElement){
    const user_id = idDivElement.getAttribute("data-user-id");
    // We check to see of connection exists, if so we don't create a new connection
    const subscriptions = consumer.subscriptions.subscriptions;
    let notificationChannel = subscriptions.find((subscriptionsObject)=>{
      const identifierObj = JSON.parse(subscriptionsObject.identifier);
      return identifierObj.channel === "NotificationChannel"
    });
    
    // Establishing a connection channedl if a connection hasn't already been established
    if(!notificationChannel){
  
      consumer.subscriptions.create({ channel: "NotificationChannel", user_id: user_id }, {
        connected() {
          // Called when the subscription is ready for use on the server
          console.log("Connected to notification channel " + user_id);
        },
      
        disconnected() {
          // Called when the subscription has been terminated by the server
        },
      
        received(data) {   // Data is the notification recived
          // Called when there's incoming data on the websocket for this channel
          console.log(data);
          const notificationsElement = document.querySelector("#notifications");
          const bellIcon = document.querySelector("#bell");
          const neNewNotificationElement = document.querySelector("#no-new-notification");
          bellIcon.style.color = "crimson";
          if(neNewNotificationElement){
            neNewNotificationElement.style.display = "none"; 
          }
          let newNotification = "";
          let oldNotifications = notificationsElement.innerHTML;
          if(data.category === 0){  // Invitaion
            newNotification = `<a class="dropdown-item" href="#" data-seen="false" data-id="${data.notification_id}"> ${data.sender.full_name}
                                  Has Invited You to His Order</a>`
            newNotification += `<div class="dropdown-divider"></div>`;
          }else{  // Accept
            newNotification = `<a class="dropdown-item" href="#" data-seen="false" data-id="${data.notification_id}"> ${data.sender.full_name}
                                Joined Your ${data.order.order_for}</a>`
            newNotification += `<div class="dropdown-divider"></div>`;
          }
          notificationsElement.innerHTML = newNotification + oldNotifications;
        }
      });
    }
  }
});




