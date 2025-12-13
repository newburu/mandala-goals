import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mandala"
export default class extends Controller {
  static targets = ["center", "subgrid"]

  connect() {
    this.showCenter()
  }

  showSubgrid(event) {
    // データ属性から位置を取得 (0-8)
    const position = event.currentTarget.dataset.position
    
    if (position === "4") {
      // 中心をクリックした場合は何もしない（あるいは編集モードへ？）
      // 今回の要件では「詳細」なので、中心グリッドの中心は「さらに詳細」はない。
      return
    }

    // 全て隠す
    this.hideAll()
    
    // 指定されたサブグリッドを表示
    const targetSubgrid = this.subgridTargets.find(t => t.dataset.position === position)
    if (targetSubgrid) {
      targetSubgrid.classList.remove("hidden")
    }
  }

  showCenter() {
    this.hideAll()
    this.centerTarget.classList.remove("hidden")
  }

  hideAll() {
    this.centerTarget.classList.add("hidden")
    this.subgridTargets.forEach(el => el.classList.add("hidden"))
  }
}
