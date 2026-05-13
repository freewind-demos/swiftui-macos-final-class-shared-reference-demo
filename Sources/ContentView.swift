import SwiftUI

// 这是主界面。
struct ContentView: View {
  // 直接观察共享笔记本。
  @ObservedObject var notebook: SharedNotebook

  // 这是拍下来的值拷贝。
  @State private var frozenSnapshot = "还没拍快照"

  // 组织整体布局。
  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      headerCard

      HStack(alignment: .top, spacing: 16) {
        editorPanel(title: "左边前台")
        editorPanel(title: "右边前台")
      }

      snapshotPanel
    }
    .padding(20)
    .frame(minWidth: 1100, minHeight: 760)
  }

  // 顶部说明卡。
  private var headerCard: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("final class = 大家拿的是同 1 本共享本子")
        .font(.system(size: 28, weight: .bold))

      Text("左右两个面板都拿到同 1 个 SharedNotebook。你改左边，右边同步；对象 id 也完全相同。")
        .foregroundStyle(.secondary)

      HStack(spacing: 10) {
        badge("引用共享")
        badge("同 1 个 ObjectIdentifier")
        badge("final = 不打算继承")
      }
    }
    .padding(18)
    .background(.thinMaterial)
    .clipShape(RoundedRectangle(cornerRadius: 16))
  }

  // 左右共用编辑面板。
  private func editorPanel(title: String) -> some View {
    VStack(alignment: .leading, spacing: 14) {
      Text(title)
        .font(.headline)

      stateRow(name: "对象 id", value: notebook.identityText)

      TextEditor(text: $notebook.draft)
        .font(.body)
        .frame(minHeight: 220)
        .padding(8)
        .background(Color.primary.opacity(0.04))
        .clipShape(RoundedRectangle(cornerRadius: 12))

      HStack {
        Button("写入会议纪要") {
          notebook.writeMeetingTemplate()
        }

        Button("写入报销提醒") {
          notebook.writeExpenseTemplate()
        }

        Button("清空") {
          notebook.clear()
        }
      }

      Text("这里不是两份草稿，而是同 1 份 draft。")
        .foregroundStyle(.secondary)

      Spacer(minLength: 0)
    }
    .padding(18)
    .frame(maxWidth: .infinity, minHeight: 380, alignment: .topLeading)
    .background(.regularMaterial)
    .clipShape(RoundedRectangle(cornerRadius: 16))
  }

  // 底部快照区。
  private var snapshotPanel: some View {
    VStack(alignment: .leading, spacing: 14) {
      Text("值快照对比")
        .font(.headline)

      Button("拍快照") {
        frozenSnapshot = notebook.draft
      }

      insightCard(
        title: "共享笔记本当前内容",
        body: notebook.draft.isEmpty ? "空" : notebook.draft
      )

      insightCard(
        title: "拍下来的值快照",
        body: frozenSnapshot
      )

      insightCard(
        title: "看点",
        body: "共享笔记本后续继续变，但快照不会跟着变。这样你能直观看到：class 共享的是引用，快照留下的是值副本。"
      )
    }
    .padding(18)
    .background(.regularMaterial)
    .clipShape(RoundedRectangle(cornerRadius: 16))
  }

  // 构造状态行。
  private func stateRow(name: String, value: String) -> some View {
    VStack(alignment: .leading, spacing: 4) {
      Text(name)
        .font(.caption)
        .foregroundStyle(.secondary)

      Text(value)
        .font(.system(.body, design: .monospaced))
        .textSelection(.enabled)
    }
  }

  // 构造说明卡片。
  private func insightCard(title: String, body: String) -> some View {
    VStack(alignment: .leading, spacing: 8) {
      Text(title)
        .font(.headline)

      Text(body)
        .foregroundStyle(.secondary)
    }
    .padding(14)
    .background(Color.primary.opacity(0.04))
    .clipShape(RoundedRectangle(cornerRadius: 12))
  }

  // 顶部小标签。
  private func badge(_ text: String) -> some View {
    Text(text)
      .font(.caption.weight(.medium))
      .padding(.horizontal, 10)
      .padding(.vertical, 6)
      .background(Color.primary.opacity(0.06))
      .clipShape(Capsule())
  }
}
