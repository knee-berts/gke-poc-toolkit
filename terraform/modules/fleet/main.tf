/**
 * Copyright 2024 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

data "google_project" "cluster_project" {
  project_id = var.project_id
}

data "google_project" "fleet_project" {
  project_id = var.fleet_project
}

data "google_project" "vpc_project" {
  project_id = var.vpc_project_id
}

locals {
  # Hub service account
  hub_service_account_email = format("service-%s@gcp-sa-gkehub.iam.gserviceaccount.com", data.google_project.fleet_project.number)
  hub_service_account       = "serviceAccount:${local.hub_service_account_email}"
}