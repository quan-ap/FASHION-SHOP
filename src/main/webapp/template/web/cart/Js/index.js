import { callApi, postApi, deleteApi, putApi } from "./ActionApi/index.js";





window.onload = function () {
	

  let getBtnClearAll = document.getElementById(
    "container__wrap-link__btn-clear"
  );
  getBtnClearAll.addEventListener("click", () => {
    let arr = JSON.parse(localStorage.getItem("array"));
    arr.forEach((item) => {
      deleteApi(item.id, start);
    });
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

  let render = (arrItems = []) => {
    let newItems = [...arrItems];
    let getTotalItem = document.getElementById("total-item");
    let getTotalProducts = document.getElementById("total-products");
    let viewItemsCart = document.getElementById("view-items-cart");
    let totalItems = 0;
    if (newItems.length == 0) {
      let getWrapContentCart = document.getElementById(
        "container__wrap-content-cart"
      );
      getWrapContentCart.classList.add("hidden");
      getWrapContentCart.innerHTML = `
    <div class="wrap-empty-cart">
       <img class="wrap-empty-cart__img" src="../template/web/image/empty-cart.png" >
       <h2 class="wrap-empty-cart__text">No items found in cart</h3>
       <a class="wrap-empty-cart__link" href="#">Shop Now</a>
  </div>`;
      getWrapContentCart.classList.remove("hidden");
    }

    let products = newItems.map((item) => {
      // console.log(item.quantity * item.price);
      let total = Number((item.quantity * item.price).toFixed(1));
      totalItems += total;
      return `<tr>
        <th scope="row"><a href="#"><img class="table__img" src="${item.image}"></a></th>
        <td class="table__style-col"><a href="#"><span class="table__title">${item.name}</span></a>
        <p style="font-size: 1.4rem;" class="table__size">Size: ${item.size}</p>
        </td>
        <td class="table__style-col"><span class="table__price">$${item.price}</span></td>
        <td class="table__style-col">
            <div class="table__qnt">
                <button class="btn-decrease" data=${item.id} name=${item.quantity}>-</button>
                <input class="table__qnt__input" type="text" readonly value="${item.quantity}">
                <button class="btn-increase" data=${item.id} name=${item.quantity}>+</button>
            </div>
        </td>
        <td class="table__style-col"><span class="table__total">$${total}</span></td>
        <td class="table__style-col"><button class="btn-delete" name=${item.id}>X</button></td>
    </tr>`;
    });

    viewItemsCart.innerHTML = products.join("");
    getTotalItem.innerHTML = "$" + totalItems.toFixed(1);
    getTotalProducts.innerHTML = arrItems.length;

    let btnDelete = document.querySelectorAll(".btn-delete");
    btnDelete.forEach((btn) => {
      btn.addEventListener("click", () => {
        deleteApi(btn.getAttribute("name"), start);
      });
    });

    let btnDecrease = document.querySelectorAll(".btn-increase");
    btnDecrease.forEach((btn) => {
      btn.addEventListener("click", () => {
        newItems.forEach((value) => {
          if (btn.getAttribute("data") == value.id) {
            putApi(
              { id: btn.getAttribute("data"), name: value.name, price:value.price, quantity: value.quantity + 1, size: value.size, image: value.image },
              start,
              btn.getAttribute("data")
            );
          }
        });
        notifyCart(
          true,
          "toast-bottom-left",
          "success",
          "1200",
          "Added To Cart"
        );
      });
    });

    let btnIncrease = document.querySelectorAll(".btn-decrease");
    btnIncrease.forEach((btn) => {
      btn.addEventListener("click", () => {
        newItems.forEach((value) => {
          if (btn.getAttribute("data") == value.id) {
            if (value.quantity - 1 > 0) {
              putApi(
            		  { id: btn.getAttribute("data"), name: value.name, price:value.price, quantity: value.quantity - 1, size: value.size, image: value.image },
                start,
                value.id
              );
              notifyCart(
                true,
                "toast-bottom-left",
                "warning",
                "1200",
                "Item Decremented From Cart"
              );
            } else {
              notifyCart(
                false,
                "toast-top-center",
                "error",
                "1600",
                "Number Of Products Cannot Be Less Than 1 !!!",
                "Notification"
              );
            }
          }
        });
      });
    });
  };

  let start = () => {
    callApi(render);
  };
  start();
  
};