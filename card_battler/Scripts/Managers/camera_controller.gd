extends Camera2D
class_name Cameracontroller

var shake_intensity : float = 0

func _enter_tree() -> void:
	ManagerRegistry.register('camera_controller', self)


func _exit_tree() -> void:
	ManagerRegistry.unregister('camera_controller')

func shake(intensity : float):
	shake_intensity = intensity
	
func _process(delta: float) -> void:
	if shake_intensity <= 0:
		return
		
	shake_intensity = lerpf(shake_intensity, 0, delta * 10)
	offset.x = randf_range(-shake_intensity, shake_intensity)
	offset.y = randf_range(-shake_intensity, shake_intensity)
