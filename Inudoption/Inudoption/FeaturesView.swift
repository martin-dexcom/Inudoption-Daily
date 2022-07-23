import SwiftUI

struct Feature {
    let title: String
    let description: String
    let imageName: String
}

struct FeaturesView: View {
    @Binding var shouldShowMainScreen: Bool

    let features: [Feature] = [
        Feature(title: "Find a new best friends, today",
                description: "Are you ready to begin a new adventure? We have a catalog of over 200,000 pets!",
                imageName: "pawprint.fill"),
        Feature(title: "Always Free",
                description: "Our mission is to match people with pets, not to make bank",
                imageName: "dollarsign.circle.fill"),
        Feature(title: "Dogs? Cats? Parrots?",
                description: "We've got them all!",
                imageName: "aqi.medium"),
        Feature(title: "Vaccinated and ready to go",
                description: "Every pet on the platform has gone through a medical check and is 100% vax",
                imageName: "cross.fill")
    ]

    var body: some View {
        VStack(alignment: .leading) {
            ReusableTitle(topTitle: "Welcome to", bottomTitle: "Inudoption")
            VStack(alignment: .leading, spacing: 20) {
                ForEach(features, id: \.title) { feature in
                    ReusableRow(feature: feature)
                }
            }
            Spacer()
            HStack {
                Spacer()
                Button("Start") {
                    shouldShowMainScreen = true
                }
                .padding()
                .background(Color.inuPrimary)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                Spacer()
            }
        }
        .padding(.horizontal, 32)
        .padding(.vertical, 67)
    }
}

struct ReusableRow: View {
    let feature: Feature

    var body: some View {
        HStack {
            ReusableRoundedIcon(imageName: feature.imageName)
            VStack(alignment: .leading, spacing: 0) {
                Text(feature.title)
                    .font(.headline)
                Text(feature.description)
                    .font(.caption2)
                    .foregroundColor(.inuTertiary.opacity(0.6))
            }
        }
    }
}

struct ReusableRoundedIcon: View {
    let imageName: String

    var body: some View {
        ZStack(alignment: .center) {
            // 0
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 53, height: 53)
                .foregroundColor(.inuPrimary)
            // 1
            Image(systemName: imageName)
                .imageScale(.large)
                .foregroundColor(.inuSecondary)
        }
    }
}

struct ReusableTitle: View {
    let topTitle: String
    let bottomTitle: String

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(topTitle)
                .font(.subheadline)
                .bold()
                .foregroundColor(.inuTertiary.opacity(0.6))
            Text(bottomTitle)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.inuPrimary)
        }
    }
}

struct FeatureViewPreview: PreviewProvider {
    static var previews: some View {
        FeaturesView(shouldShowMainScreen: .constant(false))
    }
}
