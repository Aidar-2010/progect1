//
//  Reposetories.swift
//  proect1
//
//  Created by user on 12.10.2024.
//

import Foundation
import Supabase

class Reposetories {
    static let instance = Reposetories()
    
    let supabase = SupabaseClient(
        supabaseURL: URL( string: "https://gsjseqhbzywalhjxmvyk.supabase.co")!,
        supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdzanNlcWhienl3YWxoanhtdnlrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjg0Mzg5NTgsImV4cCI6MjA0NDAxNDk1OH0.t6r0tc-uoqXOKWm6yHtnb_fghIiq7Hsle022NvxZsWA",
        options: .init())
    
    
    func signUp (name: String, phone: String, email: String, password: String)
    async throws{
        try await supabase.auth.signUp (email: email, password: password)
        let user = try await supabase.auth.session.user
        let newUser = UserModel (id: user.id, name: name, phone: phone, created_at: .now)
        try await supabase.from ("users")
        .insert(newUser)
        .execute()
        try await supabase.auth.signOut()    }
    
}
