// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Login {
    /// Sign In
    internal static let button = L10n.tr("Localizable", "login.button", fallback: "Sign In")
    /// Forgot Password?
    internal static let forgotPassword = L10n.tr("Localizable", "login.forgotPassword", fallback: "Forgot Password?")
    internal enum Logo {
      /// Hope you’re doing fine.
      internal static let subtitle = L10n.tr("Localizable", "login.logo.subtitle", fallback: "Hope you’re doing fine.")
      /// Hi, Welcome Back! 
      internal static let title = L10n.tr("Localizable", "login.logo.title", fallback: "Hi, Welcome Back! ")
    }
    internal enum Signup {
      /// Sign up
      internal static let button = L10n.tr("Localizable", "login.signup.button", fallback: "Sign up")
      /// Don’t have an account yet?
      internal static let label = L10n.tr("Localizable", "login.signup.label", fallback: "Don’t have an account yet?")
    }
    internal enum TextField {
      /// Your Email
      internal static let email = L10n.tr("Localizable", "login.textField.email", fallback: "Your Email")
      /// Password
      internal static let password = L10n.tr("Localizable", "login.textField.password", fallback: "Password")
    }
  }
  internal enum Profile {
    /// Save
    internal static let button = L10n.tr("Localizable", "profile.button", fallback: "Save")
    /// Fill Your Profile
    internal static let title = L10n.tr("Localizable", "profile.title", fallback: "Fill Your Profile")
    internal enum Textfield {
      /// Date of Birth
      internal static let date = L10n.tr("Localizable", "profile.textfield.date", fallback: "Date of Birth")
      /// name@example.com
      internal static let email = L10n.tr("Localizable", "profile.textfield.email", fallback: "name@example.com")
      /// Gender
      internal static let gender = L10n.tr("Localizable", "profile.textfield.gender", fallback: "Gender")
      /// Michael Jordan
      internal static let name = L10n.tr("Localizable", "profile.textfield.name", fallback: "Michael Jordan")
      /// Nickname
      internal static let nickname = L10n.tr("Localizable", "profile.textfield.nickname", fallback: "Nickname")
    }
  }
  internal enum Signup {
    /// Create Account
    internal static let button = L10n.tr("Localizable", "signup.button", fallback: "Create Account")
    internal enum Login {
      /// Sign in
      internal static let button = L10n.tr("Localizable", "signup.login.button", fallback: "Sign in")
      /// Do have an account?
      internal static let label = L10n.tr("Localizable", "signup.login.label", fallback: "Do have an account?")
    }
    internal enum Logo {
      /// We are here to help you!
      internal static let subtitle = L10n.tr("Localizable", "signup.logo.subtitle", fallback: "We are here to help you!")
      /// Create Account
      internal static let title = L10n.tr("Localizable", "signup.logo.title", fallback: "Create Account")
    }
    internal enum TextField {
      /// Your Email
      internal static let email = L10n.tr("Localizable", "signup.textField.email", fallback: "Your Email")
      /// Your Name
      internal static let name = L10n.tr("Localizable", "signup.textField.name", fallback: "Your Name")
      /// Password
      internal static let password = L10n.tr("Localizable", "signup.textField.password", fallback: "Password")
    }
  }
  internal enum SocialMedia {
    /// Sign In with Facebook
    internal static let facebook = L10n.tr("Localizable", "socialMedia.facebook", fallback: "Sign In with Facebook")
    /// Localizable.strings
    ///   Doctor-Appointment
    /// 
    ///   Created by Ahmed Yamany on 11/11/2023.
    internal static let google = L10n.tr("Localizable", "socialMedia.google", fallback: "Sign In with Google")
  }
  internal enum Splash {
    internal enum Button {
      /// Next
      internal static let next = L10n.tr("Localizable", "splash.button.next", fallback: "Next")
      /// Skip
      internal static let skip = L10n.tr("Localizable", "splash.button.skip", fallback: "Skip")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
