<swiper>

  <style type="text/scss">
    @import "../styles/colors";
    @import "../styles/animations/_loading-animation";

    $myBackground: url(../images/background.png);
    $margin-swiper: 24px;
    $swiper-font-size: 18px;

    :scope {
      margin: 0 auto;
      position: relative;
      overflow: hidden;
      /* Fix of Webkit flickering */
      z-index: 1;
      width: 100%;
      height: 100%;
      display: flex;
      transition-property: transform;
      box-sizing: content-box;
      transform: translate3d(0px, 0, 0);
    }
    .swiper-container-no-flexbox .swiper-slide {
      float: left;
    }
    .swiper-slide {
      flex-shrink: 0;
      width: 100%;
      height: 100%;
      position: relative;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-grow: 1;
      left: 0;
      right: 0;
      top: 0;
      bottom: 0;
      text-align: center;
      font-size: $swiper-font-size;
      background: none;

      &.swiper-slide-active {
        overflow: hidden;
      }

      &.swiper-slide-active,
      &.swiper-slide-next {

        > .loading {
          display: block;
        }

      }

      > .full-image-cover {
        object-fit: contain;
        height: 100%;
        width: 100%;
        max-width: 100%;
        max-height: 100%;
        margin: 0;
      }

      > .loading {
        @extend .loading-animation;
        display: none;
      }

      iframe {
        position: absolute;
        display: block;
        width: 100%;
        height: 100%;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
      }

    }
    /* a11y */
    .swiper-notification {
      position: absolute;
      left: 0;
      top: 0;
      pointer-events: none;
      opacity: 0;
      z-index: -1000;
    }
    /* IE10 Windows Phone 8 Fixes */
    .swiper-wp8-horizontal {
      -ms-touch-action: pan-y;
      touch-action: pan-y;
    }
    .swiper-wp8-vertical {
      -ms-touch-action: pan-x;
      touch-action: pan-x;
    }
    /* Arrows */
    .swiper-button-prev,
    .swiper-button-next {
      position: absolute;
      top: 50%;
      width: 27px;
      height: 44px;
      margin-top: -22px;
      z-index: 10;
      cursor: pointer;
      -moz-background-size: 27px 44px;
      -webkit-background-size: 27px 44px;
      background-size: 27px 44px;
      background-position: center;
      background-repeat: no-repeat;
    }
    .swiper-button-prev.swiper-button-disabled,
    .swiper-button-next.swiper-button-disabled {
      opacity: 0.35;
      cursor: auto;
      pointer-events: none;
    }
    .swiper-button-prev,
    .swiper-container-rtl .swiper-button-next {
      background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M0%2C22L22%2C0l2.1%2C2.1L4.2%2C22l19.9%2C19.9L22%2C44L0%2C22L0%2C22L0%2C22z'%20fill%3D'%23007aff'%2F%3E%3C%2Fsvg%3E");
      left: 10px;
      right: auto;
    }
    .swiper-button-prev.swiper-button-black,
    .swiper-container-rtl .swiper-button-next.swiper-button-black {
      background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M0%2C22L22%2C0l2.1%2C2.1L4.2%2C22l19.9%2C19.9L22%2C44L0%2C22L0%2C22L0%2C22z'%20fill%3D'%23000000'%2F%3E%3C%2Fsvg%3E");
    }
    .swiper-button-prev.swiper-button-white,
    .swiper-container-rtl .swiper-button-next.swiper-button-white {
      background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M0%2C22L22%2C0l2.1%2C2.1L4.2%2C22l19.9%2C19.9L22%2C44L0%2C22L0%2C22L0%2C22z'%20fill%3D'%23ffffff'%2F%3E%3C%2Fsvg%3E");
    }
    .swiper-button-next,
    .swiper-container-rtl .swiper-button-prev {
      background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M27%2C22L27%2C22L5%2C44l-2.1-2.1L22.8%2C22L2.9%2C2.1L5%2C0L27%2C22L27%2C22z'%20fill%3D'%23007aff'%2F%3E%3C%2Fsvg%3E");
      right: 10px;
      left: auto;
    }
    .swiper-button-next.swiper-button-black,
    .swiper-container-rtl .swiper-button-prev.swiper-button-black {
      background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M27%2C22L27%2C22L5%2C44l-2.1-2.1L22.8%2C22L2.9%2C2.1L5%2C0L27%2C22L27%2C22z'%20fill%3D'%23000000'%2F%3E%3C%2Fsvg%3E");
    }
    .swiper-button-next.swiper-button-white,
    .swiper-container-rtl .swiper-button-prev.swiper-button-white {
      background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M27%2C22L27%2C22L5%2C44l-2.1-2.1L22.8%2C22L2.9%2C2.1L5%2C0L27%2C22L27%2C22z'%20fill%3D'%23ffffff'%2F%3E%3C%2Fsvg%3E");
    }
    /* Pagination Styles */
    .swiper-pagination {
      position: absolute;
      text-align: center;
      transition: 300ms;
      transform: translate3d(0, 0, 0);
      z-index: 10;
    }
    .swiper-pagination.swiper-pagination-hidden {
      opacity: 0;
    }
    /* Common Styles */
    .swiper-pagination-fraction,
    .swiper-pagination-custom,
    .swiper-container-horizontal > .swiper-pagination-bullets {
      bottom: 10px;
      left: 0;
      width: 100%;
    }
    /* Bullets */
    .swiper-pagination-bullet {
      width: 8px;
      height: 8px;
      display: inline-block;
      border-radius: 100%;
      background: #000;
      opacity: 0.2;
    }
    button.swiper-pagination-bullet {
      border: none;
      margin: 0;
      padding: 0;
      box-shadow: none;
      -moz-appearance: none;
      -ms-appearance: none;
      -webkit-appearance: none;
      appearance: none;
    }
    .swiper-pagination-clickable .swiper-pagination-bullet {
      cursor: pointer;
    }
    .swiper-pagination-white .swiper-pagination-bullet {
      background: #fff;
    }
    .swiper-pagination-bullet-active {
      opacity: 1;
      background: #007aff;
    }
    .swiper-pagination-white .swiper-pagination-bullet-active {
      background: #fff;
    }
    .swiper-pagination-black .swiper-pagination-bullet-active {
      background: #000;
    }
    .swiper-container-horizontal > .swiper-pagination-bullets .swiper-pagination-bullet {
      margin: 0 5px;
    }
    /* Progress */
    .swiper-pagination-progress {
      background: rgba(0, 0, 0, 0.25);
      position: absolute;
    }
    .swiper-pagination-progress .swiper-pagination-progressbar {
      background: $primary-color-light;
      position: absolute;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      transform: scale(0);
      transform-origin: left top;
    }
    .swiper-container-rtl .swiper-pagination-progress .swiper-pagination-progressbar {
      transform-origin: right top;
    }
    .swiper-pagination-progress.swiper-pagination-white {
      background: rgba(255, 255, 255, 0.5);
    }
    .swiper-pagination-progress.swiper-pagination-white .swiper-pagination-progressbar {
      background: #fff;
    }
    .swiper-pagination-progress.swiper-pagination-black .swiper-pagination-progressbar {
      background: #000;
    }
    /* Scrollbar */
    .swiper-scrollbar {
      border-radius: 10px;
      position: relative;
      -ms-touch-action: none;
      background: rgba(0, 0, 0, 0.1);
    }
    .swiper-container-horizontal > .swiper-scrollbar {
      position: absolute;
      left: 1%;
      bottom: 3px;
      z-index: 50;
      height: 5px;
      width: 98%;
    }
    .swiper-scrollbar-drag {
      height: 100%;
      width: 100%;
      position: relative;
      background: rgba(0, 0, 0, 0.5);
      border-radius: 10px;
      left: 0;
      top: 0;
    }
    .swiper-scrollbar-cursor-drag {
      cursor: move;
    }
    /* Preloader */
    .swiper-lazy-preloader {
      width: 42px;
      height: 42px;
      position: absolute;
      left: 50%;
      top: 50%;
      margin-left: -21px;
      margin-top: -21px;
      z-index: 10;
      transform-origin: 50%;
      animation: swiper-preloader-spin 1s steps(12, end) infinite;
    }
    .swiper-lazy-preloader:after {
      display: block;
      content: '';
      width: 100%;
      height: 100%;
      background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg%20viewBox%3D'0%200%20120%20120'%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20xmlns%3Axlink%3D'http%3A%2F%2Fwww.w3.org%2F1999%2Fxlink'%3E%3Cdefs%3E%3Cline%20id%3D'l'%20x1%3D'60'%20x2%3D'60'%20y1%3D'7'%20y2%3D'27'%20stroke%3D'%236c6c6c'%20stroke-width%3D'11'%20stroke-linecap%3D'round'%2F%3E%3C%2Fdefs%3E%3Cg%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(30%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(60%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(90%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(120%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(150%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.37'%20transform%3D'rotate(180%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.46'%20transform%3D'rotate(210%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.56'%20transform%3D'rotate(240%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.66'%20transform%3D'rotate(270%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.75'%20transform%3D'rotate(300%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.85'%20transform%3D'rotate(330%2060%2C60)'%2F%3E%3C%2Fg%3E%3C%2Fsvg%3E");
      background-position: 50%;
      -webkit-background-size: 100%;
      background-size: 100%;
      background-repeat: no-repeat;
    }
    .swiper-lazy-preloader-white:after {
      background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg%20viewBox%3D'0%200%20120%20120'%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20xmlns%3Axlink%3D'http%3A%2F%2Fwww.w3.org%2F1999%2Fxlink'%3E%3Cdefs%3E%3Cline%20id%3D'l'%20x1%3D'60'%20x2%3D'60'%20y1%3D'7'%20y2%3D'27'%20stroke%3D'%23fff'%20stroke-width%3D'11'%20stroke-linecap%3D'round'%2F%3E%3C%2Fdefs%3E%3Cg%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(30%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(60%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(90%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(120%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(150%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.37'%20transform%3D'rotate(180%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.46'%20transform%3D'rotate(210%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.56'%20transform%3D'rotate(240%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.66'%20transform%3D'rotate(270%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.75'%20transform%3D'rotate(300%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.85'%20transform%3D'rotate(330%2060%2C60)'%2F%3E%3C%2Fg%3E%3C%2Fsvg%3E");
    }
    @-webkit-keyframes swiper-preloader-spin {
      100% {
        -webkit-transform: rotate(360deg);
      }
    }
    @keyframes swiper-preloader-spin {
      100% {
        transform: rotate(360deg);
      }
    }
    .swiper-pagination-progress {
      width: 100%;
      left: 0;
      top: calc(100% - 8px);
      height: 8px;
    }
    .swiper-pagination {
      bottom: $margin-swiper !important;

      &.swiper-pagination-clickable {

        &.swiper-pagination-bullets span {
          position: relative;
          z-index: 1;
        }

        &.swiper-pagination-bullets::after {
          content: '';
          position: absolute;
          display: block;
          background: $myBackground;
          left: 0;
          right: 0;
          top: -$margin-swiper;
          bottom: -$margin-swiper;
          z-index: 0;
          opacity: .2;
          pointer-events: none;
        }

      }

    }

    .swiper-wrapper {
      position: relative;
      width: 100%;
      height: 100%;
      z-index: 1;
      display: flex;
      transition-property: transform;
      box-sizing: content-box;
      transform: translate3d(0px, 0, 0);
      top: 0;
      bottom: 0;
      left: 0;
      right: 0;
      max-height: 100%;
      margin: 0;
    }
  </style>

  <div class="swiper-wrapper">
    <div class="swiper-slide" each="{val in opts.data}">
      <img if="{val.photo}"
           data-src="{val.photo}"
           alt=""
           class="full-image-cover scale-up swiper-lazy"/>
      <youtube if="{val.youtube}"
               url="{val.youtube}"/>

      <div class="loading"></div>
    </div>
  </div>
  <div class="swiper-pagination"></div>

  <script>
    import Swiper from '../vendors/swiper/swiper.min';

    this.on('mount', () => {
      new Swiper(this.root, {
        direction: 'horizontal',
        pagination: '.swiper-pagination',
        paginationType: 'progress',
        scrollbarHide: true,
        slidesPerView: 1,
        centeredSlides: true,
        paginationClickable: true,
        spaceBetween: 8,
        grabCursor: true,
        mousewheelControl: true,
        preloadImages: false,
        lazyLoading: true,
        keyboardControl: true,
        /**
         *
         * @param swiper
         * @param e {Event}
         */
        onScroll(swiper, e) {
          e.stopImmediatePropagation();
        },
        /**
         *
         * @param swiper
         * @param slide {HTMLElement}
         */
        onLazyImageReady(swiper, slide) {
          const loadingElem = slide.querySelector('.loading');

          if (loadingElem) {
            loadingElem.parentElement.removeChild(loadingElem);
          }
        }
      });
    });

  </script>

</swiper>
