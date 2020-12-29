
import { callApi, postApi, deleteApi, putApi } from "./ActionApi/index.js";



		
	let getQntItem = document.querySelector(".pro-qty input[type='text']");
	
	getQntItem.setAttribute("value", "1");
	
	
	let getIncre = document.querySelector(".inc")
	getIncre.addEventListener("click", () =>{
		getQntItem.value + 1;
	})
	
	let getDecre = document.querySelector(".dec")
	getDecre.addEventListener("click", () =>{
		getQntItem.getAttribute("value") == 1? getQntItem.setAttribute("value", "1") : getQntItem.value - 1;
	})
	
	
  let btnAddToCart = document.querySelector(".pd-cart");
	btnAddToCart.addEventListener("click", (e) => {
		
		e.preventDefault();
		
		let obj = {}
		

		
		let getNameItem = document.querySelector(".pd-title h3");
		let getImgAttribute = document.querySelector(".product-big-img").getAttribute("src");
		let getPriceItem = document.querySelector(".pd-desc h4").innerText;
		let getSize = document.querySelector(".sc-item .active");
		
		if(getSize == null){
			 notifyCart(
		                false,
		                "toast-top-center",
		                "error",
		                "1600",
		                "Please Choose The Size Of The Product",
		                "Notification"
		              );
		}else{
			
		obj.id = getNameItem.getAttribute("data-id");
		obj.name = getNameItem.innerText;
		obj.price = Number(getPriceItem.slice(0, getPriceItem.length - 1));
		obj.quantity = Number(getQntItem.value);
		obj.size = getSize.innerText;
		obj.image = getImgAttribute;
		
		
    let arr = JSON.parse(localStorage.getItem("array"));
    let flag = false;
    let i = 0;
    if(arr.length === 0){
    	flag = true;
    }else{
    	for (const value of arr) {
  	      if (obj.id === value.id) {
  	        putApi({ id:value.id, name:value.name, price:value.price, quantity: value.quantity + obj.quantity, image: value.image, size: value.size }, start, value.id);
  	        break;
  	      } else {
  	    	  
  	    	  i += 1; //i new = i old + 1
  	        i === arr.length ? (flag = true) : "";
  	    	  
  	      }
  	    }
    }

    
 if(flag){
    	postApi(obj, start)
    }
 
 
 notifyCart(true, "toast-bottom-left", "success", "1200", "Added To Cart");
	}
    
  });
	
	

	  let notifyCart = (progress, pos, typeNoti, time, noti, title = "") => {
	    toastr.options = {
	      closeButton: false,
	      debug: false,
	      newestOnTop: false,
	      progressBar: progress,
	      positionClass: pos,
	      preventDuplicates: false,
	      onclick: null,
	      showDuration: "300",
	      hideDuration: "300",
	      timeOut: time,
	      extendedTimeOut: "300",
	      showEasing: "easeOutElastic",
	      hideEasing: "easeOutBounce",
	      showMethod: "slideDown",
	      hideMethod: "slideUp",
	    };
	    toastr[typeNoti](noti, title);
	  };

  
  let saveApiIntolacal =  (arrItems = []) => {
    let newItems = [...arrItems];
    localStorage.setItem("array", JSON.stringify(newItems));
    
  };
  

let start = () => {
    callApi(saveApiIntolacal);
  };
  start();
  



	
	
	