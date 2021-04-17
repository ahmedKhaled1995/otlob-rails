const { data } = require("jquery");
  $(document).ready(function() {
    $('#my_form').on("click", function (e) {
        e.preventDefault();
        var friendid=document.getElementById("search").value
        var content="";

        $.ajax({
            type:"GET",
            url:"test",
            dataType:"json",
            data: {some_parameter: friendid},
            success:function(result){
            //   $('#orderfriends').append('hello');

            for(i=0;i<result.length;i++){
                // alert("friend id: "+result[i].id+"\nfriend email: "+result[i].email)
                content ='<tr><td>'+result[i].id+
                '</td><td>'+result[i].name+'</td><td>'+result[i].email+'</td><td><button class="btn btn-danger" id="removefriend'+result[i].id+'">remove</button><td></tr>' ;
                // $('#orderfriends').html(content);
                $('#orderfriends').last().append(content);

              //  $(content).appendTo("#orderfriends");

               // alert("group id: "+result[i].id+"\ngroup name: "+result[i].name)

            }


            // $.each(result, function(i, value) {
            //     console.log('Value of '+ i +' is : ' + value);
            //  })

             // alert(result)
            }
          });
          
    });
  });

//   Rails.ajax({
//     url: "/friends",
//     type: "get",
//     data: "",
//     success: function(data) {},
//     error: function(data) {}
//   })

// $('#download_options').html("<%= j (render 'orders/downloads_list') %>");
// $('#download_options').slideDown(350);


//   window.onload = function(){ alert("welcome"); }







// const { data } = require("jquery");
// //   $(document).ready(function() {
    
//     $('#my_form').on("click", function (event) {
//       // console.log('hello')
       
//          ajaxcall() 
//      });
//     //         event.preventDefault();
//     // $(document).on('click', '#my_form', function (e){


//     // });
//     function ajaxcall(){
//         var friendid=document.getElementById("search").value
//         var content="";   
//         $.ajax({
//             type:"GET",
//             url:"orders/test",
//             dataType:"json",
//             data: {some_parameter: friendid},
//             success:function(result){
//             //   $('#orderfriends').append('hello');

//             for(i=0;i<result.length;i++){
//                 // alert("friend id: "+result[i].id+"\nfriend email: "+result[i].email)
//                 // content = result[i].id;
//                 // content += "<br>";
//                 // // $('#orderfriends').html(content);
//                 // $('#orderfriends').last().append('<div class="friend">' + content + '</div>');

//               //  $(content).appendTo("#orderfriends");

//                console.log("group id: "+result[i].id+"\ngroup name: "+result[i].name)

//             }


//             // $.each(result, function(i, value) {
//             //     console.log('Value of '+ i +' is : ' + value);
//             //  })

//              // alert(result)
//             }
//           });
//     }

