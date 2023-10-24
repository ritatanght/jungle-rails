describe("Add a product to cart", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000/");
  });

  it("Click the 'Add to Cart' button for a product on the home page and cart increases by one", () => {
    // check cart is empty before add to cart action
    cy.contains(".nav-link", "My Cart")
      .contains("My Cart (0)")
      .should("be.visible");

    cy.get(".btn").contains("Add").first().click({ force: true });

    cy.contains(".nav-link", "My Cart")
      .contains("My Cart (1)")
      .should("be.visible");
  });
});
