import SwiftUI

extension View {
    func asIcon(color: Color) -> some View {
        self
            .font(.largeTitle)
            .symbolVariant(.fill)
            .foregroundStyle(.white)
            .padding()
            .frame(width: 64, height: 64)
            .background(color.gradient, in: .rect(cornerRadius: 16, style: .continuous))
    }

    func badge(_ value: Int, alignment: Alignment) -> some View {
        overlay(alignment: alignment) {
            Badge(value: value)
                .alignmentGuide(alignment.vertical, computeValue: { dimension in
                    dimension[VerticalAlignment.center]
                })
                .alignmentGuide(alignment.horizontal, computeValue: { dimension in
                    dimension[HorizontalAlignment.center]
                })
                .fixedSize()
        }
    }
}

struct Badge: View {
    var value: Int
    @ScaledMetric(relativeTo: .body) private var minWidth = 24
    var body: some View {
        Text("\(value)")
            .font(.body)
            .foregroundStyle(.white)
            .padding(.horizontal, 8)
            .frame(minWidth: minWidth)
            .frame(height: minWidth)
            .background(.red.gradient, in: .capsule)
    }
}


struct ContentView: View {
    var body: some View {
        HStack {
            Image(systemName: "phone")
                .asIcon(color: .green)
            Image(systemName: "message")
                .asIcon(color: .green)
                .badge(1000, alignment: .topTrailing)
            Image(systemName: "book")
                .asIcon(color: .orange)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
