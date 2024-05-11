import SwiftUI
import Shimmer

struct ShimmerView: View {
    
    var body: some View {
        Rectangle()
            .shimmering(
                active: true,
                animation: .easeInOut(duration: 2).repeatCount(5, autoreverses: false).delay(1)
            )
    }
}


#Preview {
    ShimmerView()
}
