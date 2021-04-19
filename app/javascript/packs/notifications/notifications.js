document.addEventListener('turbolinks:load', ()=>{
    
    console.log("Bell script loaded");


    const bellIcon = document.querySelector("#bell-link");

    console.log(bellIcon);



    bellIcon.addEventListener("click", (e)=>{
        console.log("bell clicked");
    });

});

