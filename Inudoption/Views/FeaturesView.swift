import SwiftUI

struct Feature {
    let title: String
    let description: String
    let imageName: String
}

struct FeaturesView: View {
    @Binding var shouldShowMainScreen: Bool

    let features: [Feature] = [
        Feature(title: "findFriend",
                description: "begin",
                imageName: "pawprint.fill"),
        Feature(title: "alwaysFree",
                description: "ourMission",
                imageName: "dollarsign.circle.fill"),
        Feature(title: "animal",
                description: "all",
                imageName: "aqi.medium"),
        Feature(title: "vaccinated",
                description: "every",
                imageName: "cross.fill")
    ]

    var body: some View {
        VStack(alignment: .leading) {
            ReusableTitle(topTitle: "welcome", bottomTitle: "Inudoption")
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
                Text(LocalizedStringKey(feature.title))
                    .font(.headline)
                    .minimumScaleFactor(0.3)
                Text(LocalizedStringKey(feature.description))
                    .font(.caption2)
                    .foregroundColor(.inuTertiary.opacity(0.6))
                    .minimumScaleFactor(0.3)
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
    let bottomTitle: LocalizedStringKey

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(LocalizedStringKey(topTitle))
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
