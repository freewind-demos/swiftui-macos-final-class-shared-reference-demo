import SwiftUI

// 这是 demo 的应用入口。
@main
struct FinalClassSharedReferenceDemoApp: App {
  // 用 StateObject 持有 1 本共享笔记本。
  @StateObject private var notebook = SharedNotebook()

  // 定义主窗口。
  var body: some Scene {
    // 用单窗口承载 demo。
    Window("Final Class Demo", id: "main") {
      // 把同 1 本共享笔记本传给内容视图。
      ContentView(notebook: notebook)
    }
    // 设 1 个舒服的默认尺寸。
    .defaultSize(width: 1180, height: 800)
  }
}
