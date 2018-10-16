import Vue from 'vue'
import { library } from '@fortawesome/fontawesome-svg-core'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

import {
  faWhmcs
} from '@fortawesome/free-brands-svg-icons'
import { faHandPointDown } from '@fortawesome/free-regular-svg-icons'
import {
  faBars, faFileSignature, faPenAlt, faPaperclip, faBookmark, faClipboardList, faCube, faProjectDiagram,
  faReceipt, faScroll
} from '@fortawesome/free-solid-svg-icons'

library.add(
  faWhmcs
)
library.add(
  faBars, faFileSignature, faPenAlt, faPaperclip, faBookmark, faClipboardList, faCube, faProjectDiagram,
  faReceipt, faHandPointDown, faScroll
)

Vue.component('font-awesome-icon', FontAwesomeIcon)