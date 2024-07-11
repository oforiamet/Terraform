terraform {
  backend "azurerm" {
    resource_group_name   = "tfstaten01672273RG"
    storage_account_name  = "tfstaten01672273sa"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
    access_key            = "+YuzkjNGzcgc/H+5OOkTCRqusSFYzG2fuzZxUV1gLfCVC5FHdxyPlQXNyQP8BvwQbidTDRurM9EU+AStWJy0GA=="
  }
}

